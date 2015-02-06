remote_file "/usr/local/bin/lein" do
  source "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein"
  action :create_if_missing
  mode "0755"
end
