class ApacheKnoxAT060 < Formula
  desc "Apache Knox"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/0.6.0/knox-0.6.0.tar.gz"
  version "0.6.0"
  sha256 "d348ae19fde4da80c0718227afffec9b2bcda7f8c0a27541f116cca9e0c52210"

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
