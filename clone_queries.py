from os import listdir
import subprocess

organisation_name = "noti-rs"
repository_name = "tree-sitter-noti"

subprocess.run(["git", "clone", f"https://github.com/{organisation_name}/{repository_name}"])

table = {}

for query in listdir(f"{repository_name}/queries"):
    with open(f"{repository_name}/queries/{query}", "r") as query_file:
        query_name = query.split(".")[0]
        table[query_name] = query_file.read()


subprocess.run(["rm", "-rf", repository_name])

file_content = "local M = {}\n"
for query_name, content in table.items():
    file_content += f"""
M["{query_name}"] = [[
{content}
]]
"""

file_content += "\nreturn M"

target_filename = "lua/noti/queries.lua"
with open(target_filename, "w+") as file:
    file.truncate(0)
    file.write(file_content)
