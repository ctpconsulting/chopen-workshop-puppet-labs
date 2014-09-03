require 'spec_helper'

describe 'nginx' do

    context 'with defaults for all parameters' do
        let (:facts) { 
            {
                :operatingsystem         => 'Ubuntu',
            }
        }
        it 'should contain the main nginx class' do
            should contain_class('nginx')
        end
        it 'should contain the nginx package' do
            should contain_package('nginx')
        end
    end

end
