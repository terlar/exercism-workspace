export class SimpleCipher {
  public key: string
  private chars = "abcdefghijklmnopqrstuvwxyz"

  constructor(key?: string) {
    if (key) {
      this.key = key
    } else {
      this.key = Array.from({ length: 100 }, () =>
        this.chars.charAt(Math.floor(Math.random() * this.chars.length))
      ).join("")
    }
  }

  private shiftFn(operatorFn: (a: number, b: number) => number) {
    return (message: string): string =>
      Array.from(message)
        .map((char, i) => {
          const pos = this.chars.indexOf(char)
          const distance = this.chars.indexOf(this.key[i % this.key.length])
          return this.chars.substr(
            operatorFn(pos, distance) % this.chars.length,
            1
          )
        })
        .join("")
  }

  public encode = this.shiftFn((a, b) => a + b)
  public decode = this.shiftFn((a, b) => a - b)
}
