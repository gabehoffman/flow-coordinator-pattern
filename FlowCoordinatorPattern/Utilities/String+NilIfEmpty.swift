extension String {
    var nilIfEmpty: String? {
        if self.isEmpty { return nil }
        return self
    }
}
