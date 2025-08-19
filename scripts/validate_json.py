import json
import sys

REQUIRED_FIELDS = ["domain", "prompt", "rubric", "submissions"]
RUBRIC_REQUIRED_FIELDS = ["rubric_id", "criteria"]
CRITERION_REQUIRED_FIELDS = ["criterion_id", "name", "description", "performance_descriptors"]
PERFORMANCE_LEVELS = ["excellent", "good", "average", "needs_improvement", "poor"]
SUBMISSION_REQUIRED_FIELDS = ["quality", "key_points", "llm_questions"]

def validate_file(file_path):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)
    except Exception as e:
        print(f"Error loading JSON: {e}")
        return False

    for field in REQUIRED_FIELDS:
        if field not in data:
            print(f"Missing top-level field: {field}")
            return False

    rubric = data["rubric"]
    for field in RUBRIC_REQUIRED_FIELDS:
        if field not in rubric:
            print(f"Missing rubric field: {field}")
            return False

    for i, criterion in enumerate(rubric.get("criteria", [])):
        for field in CRITERION_REQUIRED_FIELDS:
            if field not in criterion:
                print(f"Criterion {i+1} missing field: {field}")
                return False
        descriptors = criterion["performance_descriptors"]
        for level in PERFORMANCE_LEVELS:
            if level not in descriptors:
                print(f"Criterion {i+1} missing performance level: {level}")
                return False

    for i, submission in enumerate(data.get("submissions", [])):
        for field in SUBMISSION_REQUIRED_FIELDS:
            if field not in submission:
                print(f"Submission {i+1} missing field: {field}")
                return False
        if submission["quality"] not in ["Excellent", "Good", "Average", "Needs Improvement", "Poor"]:
            print(f"Submission {i+1} has invalid quality label: {submission['quality']}")
            return False

    print("JSON is valid.")
    return True

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python validate_json.py <path_to_json>")
        sys.exit(1)
    file_path = sys.argv[1]
    is_valid = validate_file(file_path)
    sys.exit(0 if is_valid else 1)