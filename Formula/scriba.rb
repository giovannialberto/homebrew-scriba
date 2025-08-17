class Scriba < Formula
  desc "Modern CLI tool for recording and transcribing audio using OpenAI Whisper"
  homepage "https://github.com/giovannialberto/scriba"
  version "0.5.1"
  
  if Hardware::CPU.intel?
    url "https://github.com/giovannialberto/scriba/releases/download/v0.5.1/scriba-x86_64-apple-darwin"
    sha256 "7fd6116d2516d4e39e1313ea28b44c0165d171d58e99499c2806213a86e80ab8"
  else
    url "https://github.com/giovannialberto/scriba/releases/download/v0.5.1/scriba-aarch64-apple-darwin"
    sha256 "abb2ebcba917f2bcf8c9b06d1214272394cf3c58817807e02339387ff2806f7b"
  end
  
  def install
    bin.install "scriba-#{Hardware::CPU.intel? ? "x86_64" : "aarch64"}-apple-darwin" => "scriba"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/scriba --version")
  end
end