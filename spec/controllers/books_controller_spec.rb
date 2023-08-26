require "rails_helper"

RSpec.describe Api::V1::BooksController, type: :controller do

  describe 'get index' do    
    it 'has a max limit of 100' do
      expect(Book).to receive(:limit).with(100).and_call_original
  
     get :index, params: { limit: 999 }
    end    
  end

  describe 'Post create' do
    let(:book_name) {'Harry potter'}

    it 'calls UpdateSkuJob with correct params' do
      post :create, params: {
        author: {first_name: 'JK', last_name: 'Rowling', age: 48},
        book: {title: book_name}
      }
    end
  end

end