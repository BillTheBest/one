# -------------------------------------------------------------------------- #
# Copyright 2002-2010, OpenNebula Project Leads (OpenNebula.org)             #
#                                                                            #
# Licensed under the Apache License, Version 2.0 (the "License"); you may    #
# not use this file except in compliance with the License. You may obtain    #
# a copy of the License at                                                   #
#                                                                            #
# http://www.apache.org/licenses/LICENSE-2.0                                 #
#                                                                            #
# Unless required by applicable law or agreed to in writing, software        #
# distributed under the License is distributed on an "AS IS" BASIS,          #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   #
# See the License for the specific language governing permissions and        #
# limitations under the License.                                             #
#--------------------------------------------------------------------------- #

require 'uuid'
require 'OpenNebula'

include OpenNebula

class ImageEC2 < Image
    
    ONE_IMAGE = %q{
        NAME = "ec2-<%= uuid %>"
        TYPE = OS
    }.gsub(/^        /, '')
    
    def to_one_template()
        uuid = UUID.generate
        
        one = ERB.new(ONE_IMAGE)
        return one.result(binding)
    end
end