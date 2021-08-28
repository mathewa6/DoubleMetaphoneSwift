import DoubleMetaphoneSwift

extension String {
	var normalized: String {
		let mutableString = NSMutableString(string: self)
		
		// Transliterate all non-English text into a Latin alphabetic representation.
		CFStringTransform(mutableString,
						  nil,
						  kCFStringTransformToLatin,
						  false)
		
		// Remove any diacritics or accents
		CFStringTransform(mutableString,
						  nil,
						  kCFStringTransformStripCombiningMarks,
						  false)
		
		// Remove all non alphanumeric characters
		// https://stackoverflow.com/questions/150033/
		return String(mutableString)
			.replacingOccurrences(of: "[^\\u0000-\\u007F]+",
								  with: "",
								  options: .regularExpression,
								  range:nil)
	}
}

"SautÃ©ed, Mushrooms".normalized

let (primary, secondary) = DoubleMetaphoneSwift.calculate(input: "Tomatoes")!
primary
secondary
