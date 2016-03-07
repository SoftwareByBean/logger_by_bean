module LoggingByBean
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def create_configuration
        create_file "config/initializers/logging_by_bean.rb" do <<CONFIG_FILE_CONTENTS

class ActiveSupport::Logger::SimpleFormatter
  SEVERITY_TO_TAG_MAP     = {'DEBUG'=>'meh', 'INFO'=>'fyi', 'WARN'=>'hmm', 'ERROR'=>'wtf', 'FATAL'=>'omg', 'UNKNOWN'=>'???'}
  SEVERITY_TO_COLOR_MAP   = {'DEBUG'=>'0;37', 'INFO'=>'32', 'WARN'=>'33', 'ERROR'=>'31', 'FATAL'=>'31', 'UNKNOWN'=>'37'}
  USE_HUMOROUS_SEVERITIES = false
 
  def call(severity, time, progname, msg)
    if USE_HUMOROUS_SEVERITIES
      formatted_severity = sprintf("%-3s",SEVERITY_TO_TAG_MAP[severity])
    else
      formatted_severity = sprintf("%-5s",severity)
    end

    call_details = Kernel.caller[4].gsub(/#{Rails.root}/, '')
    call_details.match /(.+):(.+):/
    filename = $1
    line = $2

    formatted_time = time.strftime("%Y-%m-%d %H:%M:%S.") << time.usec.to_s[0..2].rjust(3)
    color = SEVERITY_TO_COLOR_MAP[severity]

    base_msg = "\033[0;37m#{formatted_time}\033[0m [\033[#{color}m#{formatted_severity}\033[0m] #{msg.strip} "

    # if this is an error or fatal or unknown exception, include the file and line number
    if severity.match(/ERROR|FATAL|UNKNOWN/)
      base_msg += "(at: #{filename}:#{line} on pid:#{$$})\n"
      base_msg += Kernel.caller[4,10].map{ |l| ' ' * 35 + l.gsub(/#{Rails.root}/,'')}.join("\n")
    end    

    return base_msg + "\n"
  end
end
CONFIG_FILE_CONTENTS  


      end
    end
  end
end