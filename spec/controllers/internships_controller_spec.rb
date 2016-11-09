require 'rails_helper'

RSpec.describe InternshipsController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:internship)
  }

  let(:invalid_attributes) {
    attributes_for(:internship, application_link: nil)
  }

  before do
    sign_in(create(:user))
  end

  describe "GET #index" do
    it "assigns all internships as @internships" do
      internship = create(:internship)
      get :index
      expect(assigns(:internships)).to eq([internship])
    end
  end

  describe "GET #show" do
    it "assigns the requested internship as @internship" do
      internship = create(:internship)
      get :show, {:id => internship.to_param}
      expect(assigns(:internship)).to eq(internship)
    end
  end

  describe "GET #new" do
    it "assigns a new internship as @internship" do
      get :new
      expect(assigns(:internship)).to be_a_new(Internship)
    end
  end

  describe "GET #edit" do
    it "assigns the requested internship as @internship" do
      internship = create(:internship)
      get :edit, {:id => internship.to_param}
      expect(assigns(:internship)).to eq(internship)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Internship" do
        expect {
          post :create, {:internship => valid_attributes}
        }.to change(Internship, :count).by(1)
      end

      it "assigns a newly created internship as @internship" do
        post :create, {:internship => valid_attributes}
        expect(assigns(:internship)).to be_a(Internship)
        expect(assigns(:internship)).to be_persisted
      end

      it "redirects to the created internship" do
        post :create, {:internship => valid_attributes}
        expect(response).to redirect_to(Internship.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved internship as @internship" do
        post :create, {:internship => invalid_attributes}
        expect(assigns(:internship)).to be_a_new(Internship)
      end

      it "re-renders the 'new' template" do
        post :create, {:internship => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:internship)
      }

      it "updates the requested internship" do
        internship = create(:internship)
        put :update, {:id => internship.to_param, :internship => new_attributes}
        internship.reload
        expect(internship.title).to eq new_attributes[:title]
      end

      it "assigns the requested internship as @internship" do
        internship = create(:internship)
        put :update, {:id => internship.to_param, :internship => valid_attributes}
        expect(assigns(:internship)).to eq(internship)
      end

      it "redirects to the internship" do
        internship = create(:internship)
        put :update, {:id => internship.to_param, :internship => valid_attributes}
        expect(response).to redirect_to(internship)
      end
    end

    context "with invalid params" do
      it "assigns the internship as @internship" do
        internship = create(:internship)
        put :update, {:id => internship.to_param, :internship => invalid_attributes}
        expect(assigns(:internship)).to eq(internship)
      end

      it "re-renders the 'edit' template" do
        internship = create(:internship)
        put :update, {:id => internship.to_param, :internship => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested internship" do
      internship = create(:internship)
      expect {
        delete :destroy, {:id => internship.to_param}
      }.to change(Internship, :count).by(-1)
    end

    it "redirects to the internships list" do
      internship = create(:internship)
      delete :destroy, {:id => internship.to_param}
      expect(response).to redirect_to(internships_url)
    end
  end

end
