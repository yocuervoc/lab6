class WsusersController < ApplicationController
    soap_service namespace: 'urn:WashOutUser', camelize_wsdl: :lower

    # check case
    soap_action "checkUser",
                :args => { :userId => :integer},
                :return => { :userValid => :boolean, :userAccount => :integer}
    def checkUser
        if (User.exists?(id: params[:userId]))
            @user = User.find(params[:userId])
            account = @user.account
            render :soap => { :userValid => true, :userAccount => account}
        else
            render :soap => { :userValid => false, :userAccount => 0}
        end
    end
end