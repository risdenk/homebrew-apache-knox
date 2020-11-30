class ApacheKnoxAT0130 < Formula
  desc "Apache Knox"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/0.13.0/knox-0.13.0.tar.gz"
  version "0.13.0"
  sha256 "28039e0a0630808732e1b8be20c5f694d0f16f064541340cfc9b611862ba6084"

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
