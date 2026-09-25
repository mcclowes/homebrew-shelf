class Shelf < Formula
  desc "Index of your repositories so agents get context on other projects"
  homepage "https://github.com/mcclowes/shelf"
  url "https://github.com/mcclowes/shelf/releases/download/v0.1.0/shelf-0.1.0.tar.gz"
  sha256 "c50d56ca1ec339102291dca72aa337fff0b6539dc4e9b011811485a310c660f8"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "dist", "package.json"
    (bin/"shelf").write_env_script libexec/"dist/main.js", PATH: "#{formula_opt_bin("node")}:$PATH"
  end

  test do
    ENV["SHELF_HOME"] = testpath/"config"
    assert_equal "shelf", JSON.parse(shell_output("#{bin}/shelf schema"))["name"]
    assert_equal version.to_s, JSON.parse(shell_output("#{bin}/shelf --output json --version"))["version"]
    (testpath/"repos/demo/.git").mkpath
    (testpath/"repos/demo/README.md").write "# Demo\n\nA demo repository for the formula test.\n"
    system bin/"shelf", "scan", "--root", testpath/"repos"
    assert_equal "demo", JSON.parse(shell_output("#{bin}/shelf show demo"))["name"]
    system bin/"shelf", "sync", "--skills-dir", testpath/"skills"
    assert_path_exists testpath/"skills/shelf/SKILL.md"
  end
end
