class ApacheKnoxShellAT0140 < Formula
  desc "Apache Knox Shell"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/0.14.0/knoxshell-0.14.0.tar.gz"
  version "0.14.0"
  sha256 "ac8bf9e38b5ff679abcbe8ff379b52cd27058d1f925fae57a218475a77b007c7"

  depends_on "openjdk@8"

  def install
    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]

    # Some binaries have really generic names (like `test`) and most seem to be
    # too special-purpose to be permanently available via PATH.
    #%w[gateway.sh ldap.sh].each do |script|
    #  (bin/script).write_env_script "#{libexec}/bin/#{script}", Language::Java.java_home_env("1.8")
    #end
  end

  test do
    system "true"
  end
end
