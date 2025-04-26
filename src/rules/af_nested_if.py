# ----------------------------------------------------
# SPDX-FileCopyrightText: AsFigo Technologies, UK
# SPDX-FileCopyrightText: VerifWorks, India
# SPDX-License-Identifier: MIT
# Author: Himank Gangwal April 02, 2025
# ----------------------------------------------------
from af_lint_rule import AsFigoLintRule
import logging

class NoNestedIfRule(AsFigoLintRule):
    """Detects if there are 4 or more nested if loops."""

    def apply(self, filePath: str, data: AsFigoLintRule.VeribleSyntax.SyntaxData):
        depthStore = [0]
        for classNode in data.tree.iter_find_all({"tag": "kClassDeclaration"}):
            className = self.getClassName(classNode)
            max_value = 0
            # filter both case and if using ifHeader and CaseStatement
            # change the order of iteration to be a preOdrder
            # for varNode in classNode.iter_find_all(filter_={"tag": ["kIfHeader", "kCaseStatement"]}, iter_=AsFigoLintRule.VeribleSyntax.PreOrderTreeIterator):
            for varNode in classNode.iter_find_all(filter_={"tag": ["kConditionalStatement", "kCaseStatement"]}, iter_=AsFigoLintRule.VeribleSyntax.PreOrderTreeIterator):
                if (varNode.depth > max_value):
                    depthStore.append(varNode.depth)
                    
                max_value = depthStore[len(depthStore)-1]
                level = depthStore.index(varNode.depth)
                # print(f"\n:max_value:{max_value}:level:{level}")                
                # print(f"\n:depth:{varNode.depth}")
                   
                if (level >= 4):
                    message = f"Found 4 or more nested if loops: {varNode.text} in file: {filePath}"
                    self.linter.logViolation("R115",message)



        
              
