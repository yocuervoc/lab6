class WsbanksController < ApplicationController
    soap_service namespace: 'urn:WashOutBank', camelize_wsdl: :lower
    # make transaction case
    soap_action "makeTransaction",
                :args   => { :sourceAccount => :integer, :targetAccount => :integer, :userId => :integer, :amount => :double},
                :return => :boolean
    def makeTransaction
      operation = Transaction.create(amount: params[:amount], sourceAccount_id: params[:sourceAccount], targetAccount_id: params[:targetAccount], iduser: params[:userId])
      @initial = Account.find(params[:sourceAccount])
      @initial.balance -= params[:amount]
      @initial.save
      @final = Account.find(params[:targetAccount])
      @final.balance += params[:amount]
      @final.save
      render :soap => true
    end
  
    # check account case
    soap_action "checkAccount",
                :args   => { :sourceAccount => :integer, :targetAccount => :integer, :amount => :double},
                :return => :boolean
    def checkAccount
      amount = params[:amount]
      validate = true
      if !(Account.exists?(id: params[:sourceAccount]))
        validate = false
      end
      if !(Account.exists?(id: params[:targetAccount]))
        validate = false
      end
      if (amount < 0)
        validate = false
      end
      render :soap => validate
    end
  end
  