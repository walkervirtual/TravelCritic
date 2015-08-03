require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:test_user){
      		User.create!({fname: 'Fido',
        			lname: 'fidos',
        			username: 'happy_fido',
        			email: 'fido@dogz.com',
        			password: '12345678',
        			password_confirmation: '12345678'})
        	}
        
    let(:valid_attributes){
      		{user: {fname: 'Fido',
        			lname: 'fidos',
        			username: 'happy_fido',
        			email: 'fido@dogz.com',
        			password: '12345678',
        			password_confirmation: '12345678'}
      		}
   		 }
   		 let(:invalid_attributes){
      		{user: {fname: 'Fido',
        			lname: 'fidos',
        			email: 'fido@dogz.com',
        			password: '12345678',
        			password_confirmation: '12345678'}
      		}
   		 }


	describe "GET #index" do
	    it "has a 200 status code" do
	      get :index
	      expect(response.status).to eq(200)
	    end
	    before do
	    	@nneomac234 = User.new
	    end
	    #it "list descending order" do
	      #get :index
	      #User.order('created_at dec').all.should == [@nneomac234, @user]
	    #end
	end

	#describe "GET #show" do
    #it "returns http success" do
      #get :show
      #expect(response).to have_http_status(:success) 
    #end
  #end

  	describe "GET #new" do
	    it "returns http success" do
	      get :new
	      expect(response).to have_http_status(:success) 
	    end
  end

  	describe "POST #create" do
  		
  		context 'when valid attributes are submitted' do

	  		before do
	        	post :create, valid_attributes
	      	end

			it "redirects to user profile" do
	      		expect(assigns(:user).email).to eq('fido@dogz.com')
	  		end
	    end

	    context 'when invalid attributes are submitted' do
	      
		    before do
		        post :create, invalid_attributes
		     end

		    it "renders the new template" do
		    	get :new
		        expect(response).to render_template(:new)
		    end

		end
	end

	describe 'PUT #update' do

	    before do
      		put :update, {id: test_user.id, user: {name: 'Barky'}}
    	end

	    it "redirects to #edit" do
	      expect(response).to redirect_to user_path(@test_user)
	    end
	    
	    it "updates the user" do
      		expect(assigns(:user).name).to eq 'Barky'
    	end
	end
  describe 'Delete #destroy' do

	 
		it "delete the shown user" do

		  	current_count = User.count

		  	delete :destroy, id: test_user.id
		  	expect(User.count).to eq(current_count -1)
		end

	end



end
