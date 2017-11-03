# Pull in version from package.json
require 'json'
file = File.read('package.json')
v = JSON.parse(file)['version']

name 'mtna_server'
maintainer 'Jonathan Porta'
maintainer_email 'jonathan@jonathanPorta.com'
license 'WTFPL'
description 'Configures a fedora 24 server that runs the mtna software'
long_description 'Configures mtna server'
version v
source_url 'https://github.com/PronghornDigital/mtna-server-cookbook'
issues_url 'https://github.com/PronghornDigital/mtna-server-cookbook/issues'
supports 'fedora'

depends 'firewall'
depends 'openssh'
depends 'nodejs'
