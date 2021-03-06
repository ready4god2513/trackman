require 'digest/md5'
 
module Trackman
  module Assets
    module Components
      module Hashable
      
        def data
          @data ||= read_file
        end

        def file_hash
          Digest::MD5.hexdigest(data)
        end
        
        protected
          def read_file
            begin
              file = File.open(path)
              return file.read
            rescue
              return nil
            ensure
              file.close 
            end    
          end
      end      
    end
  end
end