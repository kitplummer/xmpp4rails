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

require 'xmpp4r'

module Xmpp4Rails
  def register_account jid, pw
    begin
      cl = Jabber::Client.new(Jabber::JID.new(jid + "/rvooz"))
      logger.info "Connecting to register with: " + jid.to_s
      cl.connect

      # Registration of the new user account
      logger.info "Registering:" + jid.to_s
      cl.register(pw)
      logger.info "Successful"

      # Shutdown
      cl.close
    rescue Errno::ECONNREFUSED
      raise StandardError, "Connection to Openfire Failed."
    rescue Jabber::ErrorException
      raise StandardError, "Account conflict."
    end
  end

  def unregister_account jid, pw
    begin
      cl = Jabber::Client.new(Jabber::JID.new(jid + "/rvooz"))
      logger.info "Connecting to unregister with: " + jid.to_s
      cl.connect
      cl.auth(pw)
      cl.remove_registration

      cl.close
    rescue Errno::ECONNREFUSED
      raise StandardError, "Connection to Openfire Failed."
    end

  end
  
  def change_password jid, current_pw, new_pw
    begin
      #cl = Jabber::Client.new(Jabber::JID.new(jid + "/rvooz"))
      cl = Jabber::Client::new(Jabber::JID.new(jid))
      logger.info "Connecting to change password for: " + jid.to_s
      cl.connect 
      cl.auth(current_pw)
      cl.password = new_pw

      cl.close
    rescue 
      raise StandardError, "Failed to change Openfire password."
    end
  end
   
end