import shutil
import sys
from pathlib import Path

from tests.utils_tests_configs import get_res

if __name__ == "__main__":
    result_path = sys.argv[1]  # where our analysis result object is located
    result_file = sys.argv[2]  # text file to write the result to
    try:
        res = get_res(Path(result_path) / "analysis_result.pickle")
        with Path(result_file).open("w") as savef:
            if res.result is True:
                savef.write("unsat\n")
            elif res.result is False:
                witness = get_res(Path(result_path) / "counter_example.pickle")
                savef.write("sat\n" + witness)
            elif str(res.result).lower() == "timeout":
                savef.write("timeout\n")
            else:
                savef.write("unknown\n")
        shutil.rmtree(result_path, ignore_errors=True)
    except Exception as e:
        print(e)
        with Path(result_path).open("w") as savef:
            savef.write("unknown\n")
        shutil.rmtree(result_path, ignore_errors=True)
