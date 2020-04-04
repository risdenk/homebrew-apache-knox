class ApacheKnoxAT110 < Formula
  desc "Apache Knox"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/1.1.0/knox-1.1.0.tar.gz"
  version "1.1.0"
  sha256 "037cab9ccea42e87468290208cc6b9b7897e04d216fce730896ab52f7581bacd"

  bottle :unneeded

  depends_on :java => "1.8"

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
