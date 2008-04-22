# ------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------
#
# @author: Kit Plummer (kitplummer@gmail.com)
#

namespace :xmpp4rails do
  
  desc 'Setup xmpp4rails stub in your rails application tests/mocks/test subdirectory'
  task :setup do
    stub_dest = "#{RAILS_ROOT}/test/mocks/test/xmpp4rails.rb"
    stub_src = File.dirname(__FILE__) + "/../test/mocks/test/xmpp4rails.rb"

    FileUtils.chmod 0774, stub_src

    unless File.exists?(stub_dest)
      puts "Copying xmpp4rails stub to #{stub_dest}"
      FileUtils.cp_r(stub_src, stub_dest)
    end

  end

  desc 'Remove xmpp4rails stub in your rails application tests/mocks/test subdirectory'
  task :remove do
    stub_src = "#{RAILS_ROOT}/test/mock/test/xmpp4rails.rb"

    if File.exists?(stub_src)
      puts "Removing #{stub_src} ..."
      FileUtils.rm(script_src, :force => true)
    end

  end
end
