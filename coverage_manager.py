from flask import jsonify
import json



def get_coverage_summary(cov):
    cov.stop()
    cov.save()
    cov.load()
    cov.json_report(outfile="cov_tmp.json")

    with open("cov_tmp.json") as f:
        data = json.load(f)

    totals = data.get("totals", {})
    summary = {
        "line": {
            "total": totals.get("num_statements", 0),
            "covered": totals.get("covered_lines", 0),
            "percent": totals.get("percent_covered", 0),
        },
        "branch": {
            "total": totals.get("num_branches", 0),
            "covered": totals.get("covered_branches", 0),
            "percent": totals.get("percent_covered_branches", 0),
        }
    }
    cov.start()
    return summary
