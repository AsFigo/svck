# ----------------------------------------------------
# SPDX-FileCopyrightText: AsFigo Technologies, UK
# SPDX-FileCopyrightText: VerifWorks, India
# SPDX-License-Identifier: MIT
# ----------------------------------------------------
from af_lint_rule import AsFigoLintRule
import logging

class NoGlobalVarsRule(AsFigoLintRule):
    """Detects global variables and raises violations."""

    def apply(self, filePath: str, data: AsFigoLintRule.VeribleSyntax.SyntaxData):
        for varNode in data.tree.iter_find_all({"tag": "kDataDeclaration"}):
            if varNode.depth == 1:
                message = f"Found global variable: {varNode.text} in file: {filePath}"
                self.linter.logViolation("R104",message)  
