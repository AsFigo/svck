# ----------------------------------------------------
# SPDX-FileCopyrightText: AsFigo Technologies, UK
# SPDX-FileCopyrightText: VerifWorks, India
# SPDX-License-Identifier: MIT
# ----------------------------------------------------
import logging
import verible_verilog_syntax

class AsFigoLintRule:
    """Base class for all linting rules."""

    VeribleSyntax = verible_verilog_syntax

    
    def __init__(self, linter):
        self.linter = linter  # Store the linter instance

    def apply(self, filePath: str, data: verible_verilog_syntax.SyntaxData):
        """Abstract method to apply the rule."""
        raise NotImplementedError

    def getClassName(self, classNode):
        """Extracts the class name from a class declaration."""
        for header in classNode.iter_find_all({"tag": "kClassHeader"}):
            for identifier in header.iter_find_all({"tag": "SymbolIdentifier"}):
                return identifier.text
        return "Unknown"

    def getQualifiers(self, varNode):
        """Extracts variable qualifiers (e.g., local, protected, rand)."""
        qualifiers = set()
        for qualList in varNode.iter_find_all({"tag": "kQualifierList"}):
            qualifiers.update(qualList.text.split())  # Extract words
        return qualifiers
