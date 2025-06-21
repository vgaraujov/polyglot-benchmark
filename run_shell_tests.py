#!/usr/bin/env python3
import os
import subprocess
import argparse
import sys
from concurrent.futures import ThreadPoolExecutor
from termcolor import colored

def find_test_files(base_dir="shell/exercises/practice"):
    """Find all test files in the given directory."""
    test_files = []
    for root, _, files in os.walk(base_dir):
        for file in files:
            if file.endswith("_test.sh"):
                task_name = file.replace("_test.sh", "")
                test_path = os.path.join(root, file)
                test_files.append((task_name, test_path))
    return test_files

def run_test(test_info):
    """Run a single test file and return the result."""
    task_name, test_path = test_info
    
    # Get the directory containing the test file
    test_dir = os.path.dirname(test_path)
    
    # Make sure the test file is executable
    os.chmod(test_path, 0o755)
    
    # Run the test from its own directory
    try:
        result = subprocess.run(
            ["bash", os.path.basename(test_path)],
            capture_output=True,
            text=True,
            timeout=10,  # 10 second timeout for each test
            cwd=test_dir  # Run from the directory containing the test file
        )
        
        success = result.returncode == 0
        output = result.stdout.strip() + "\n" + result.stderr.strip()
        
        return {
            "task_name": task_name,
            "test_path": test_path,
            "success": success,
            "output": output,
            "return_code": result.returncode
        }
    except subprocess.TimeoutExpired:
        return {
            "task_name": task_name,
            "test_path": test_path,
            "success": False,
            "output": "Test timed out after 10 seconds",
            "return_code": -1
        }
    except Exception as e:
        return {
            "task_name": task_name,
            "test_path": test_path,
            "success": False,
            "output": f"Error running test: {str(e)}",
            "return_code": -1
        }

def print_result(result, verbose=False):
    """Print the result of a test."""
    status = colored("PASS", "green") if result["success"] else colored("FAIL", "red")
    print(f"{status} - {result['task_name']}")
    
    if verbose or not result["success"]:
        print(f"  Test path: {result['test_path']}")
        if result["output"]:
            print(f"  Output:")
            for line in result["output"].split("\n"):
                if line.strip():
                    print(f"    {line}")
        if not result["success"]:
            print(f"  Return code: {result['return_code']}")
        print()

def main():
    parser = argparse.ArgumentParser(description="Run shell task tests")
    parser.add_argument("--task", help="Run tests for a specific task")
    parser.add_argument("--verbose", "-v", action="store_true", help="Show detailed output for all tests")
    parser.add_argument("--parallel", "-p", action="store_true", help="Run tests in parallel")
    args = parser.parse_args()
    
    # Find all test files
    test_files = find_test_files()
    test_files.sort()  # Sort by task name
    
    # Filter by task name if specified
    if args.task:
        test_files = [tf for tf in test_files if args.task.lower() in tf[0].lower()]
        if not test_files:
            print(f"No tests found for task '{args.task}'")
            return 1
    
    print(f"Running {len(test_files)} tests...")
    
    # Run the tests
    results = []
    if args.parallel:
        with ThreadPoolExecutor() as executor:
            results = list(executor.map(run_test, test_files))
    else:
        for test_info in test_files:
            results.append(run_test(test_info))
    
    # Print results
    passed = 0
    failed = 0
    
    for result in results:
        print_result(result, args.verbose)
        if result["success"]:
            passed += 1
        else:
            failed += 1
    
    # Print summary
    total = passed + failed
    if failed == 0:
        print(colored(f"✅ All {total} tests passed!", "green"))
    else:
        print(colored(f"❌ {failed} of {total} tests failed", "red"))
    
    return 0 if failed == 0 else 1

if __name__ == "__main__":
    sys.exit(main())