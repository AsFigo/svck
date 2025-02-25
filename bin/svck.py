import sys
import os
# Add the 'src' directory to the Python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

import logging
import verible_verilog_syntax
from asfigo_linter import AsFigoLinter
from rules.af_no_global_vars import NoGlobalVarsRule
from rules.af_var_naming_consistency import VarNamingConsistencyRule
from rules.af_encapsulation import EncapsulationRule

class svckLinter(AsFigoLinter):
    """Linter that applies multiple rules based on Mark Glasser's book."""

    def __init__(self, configFile, logLevel=logging.INFO):
        super().__init__(configFile=configFile, logLevel=logLevel)
        self.rules = [
            NoGlobalVarsRule(self),
            VarNamingConsistencyRule(self),
            EncapsulationRule(self)]

    def loadSyntaxTree(self):
        """Loads Verilog syntax tree using VeribleVerilogSyntax."""
        parser = verible_verilog_syntax.VeribleVerilogSyntax()
        return parser.parse_files([self.testName], options={"gen_tree": True})

    def runLinter(self):
        """Runs all registered lint rules on the Verilog file."""
        treeData = self.loadSyntaxTree()

        for filePath, fileData in treeData.items():
            self.logInfo(f"Loaded test file: {self.testName}")
            
            for rule in self.rules:
                rule.apply(filePath, fileData)

            self.logSummary()


if __name__ == "__main__":
    byolDemo = svckLinter(configFile="config.toml", logLevel=logging.INFO)
    byolDemo.runLinter()
