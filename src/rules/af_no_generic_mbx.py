# ----------------------------------------------------
# SPDX-FileCopyrightText: AsFigo Technologies, UK
# SPDX-FileCopyrightText: VerifWorks, India
# SPDX-License-Identifier: MIT
# Author: Saavni Pradhan 
# ----------------------------------------------------
from af_lint_rule import AsFigoLintRule
import logging

class NoGenericMBXRule(AsFigoLintRule):
    """Avoid use of generic mailbox """
  
    def apply(self, filePath: str, data: AsFigoLintRule.VeribleSyntax.SyntaxData):

        for classNode in data.tree.iter_find_all({"tag": "kDataDeclaration"}):
          for curNode in classNode.iter_find_all({"tag": "kUnqualifiedId"}):
              if ('mailbox' in curNode.text):
                  curMbxParamsGen = curNode.iter_find_all({"tag": "kActualParameterList"})
                  curMbxitems = list(curMbxParamsGen)
                  if (len(curMbxitems) == 0):
                      message = (
                              "A generic mailbox declaration was found. "
                              "While IEEE 1800 LRM allows this, such usage is error-prone and harder to debug. "
                              "Verilator does not support this feature. Please use typed mailbox such as:"
                              "'mailbox #(int) in_box;' \n"
                              f"Source code snippet: \n{classNode.text}"
                              )
                      self.linter.logViolation("NO_GENERIX_MBX",message)


