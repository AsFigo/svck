# ----------------------------------------------------
# SPDX-FileCopyrightText: AsFigo Technologies, UK
# SPDX-FileCopyrightText: VerifWorks, India
# SPDX-License-Identifier: MIT
# Author: Himank Gangwal, April 04, 2025
# ----------------------------------------------------
from af_lint_rule import AsFigoLintRule
import anytree
import logging

class PackageCheckRule(AsFigoLintRule):
    """Detects if a class is in the scope of a package or not"""

    def apply(self, filePath: str, data: AsFigoLintRule.VeribleSyntax.SyntaxData):
        for classNode in data.tree.iter_find_all(filter_={"tag": "kClassDeclaration"}, iter_=AsFigoLintRule.VeribleSyntax.PostOrderTreeIterator):
            className = self.getClassName(classNode)
            
            ancestor = anytree.util.commonancestors(classNode)

            print(f"{className}:{ancestor}:{len(ancestor)}")
            found_package = False
            if len(ancestor) > 1:
                if "package" in ancestor[1].text:
                    found_package = True
                    print(f"{className}:{ancestor[1].text}")

            if found_package == False:
                print(f"{className}:Error no package")
                # print(f"class {className} is missing a package")
                message = f"Found a class without a package:\n {classNode.text} \n in file: {filePath}"
                self.linter.logViolation("R115",message)

            # # print(f"C:{className}:{classNode.depth}")
            # if(classNode.depth > 1):
            #     # print(f"class {className} may have package")
            #     continue
            # else:
            #     # print(f"class {className} is missing a package")
            #     message = f"Found a class without a package:\n {classNode.text} \n in file: {filePath}"
            #     self.linter.logViolation("R115",message)


