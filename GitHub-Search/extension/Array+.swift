extension Array {
  subscript (safe index: Int) -> Element? {
    return index >= 0 && index < self.count ? self[index] : nil
  }
}
