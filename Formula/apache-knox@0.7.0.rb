class ApacheKnoxAT070 < Formula
  desc "Apache Knox"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/0.7.0/knox-0.7.0.tar.gz"
  version "0.7.0"
  sha256 "b0c92a2f9c748ba3640ea66a2179e1c09471164b9a6e3bc886faf9a52c26f611"

  bottle :unneeded

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
