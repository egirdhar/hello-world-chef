ssl_verify_mode :verify_peer

def relative(path)
    File.expand_path(File.join(File.dirname(__FILE__), path))
end

cookbook_path relative('cookbooks')
json_attribs relative('node.json')
