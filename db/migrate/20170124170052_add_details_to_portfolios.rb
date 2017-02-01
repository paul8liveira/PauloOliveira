class AddDetailsToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :url_access, :string
    add_column :portfolios, :birth_date, :string
  end
end
