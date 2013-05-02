class AddMetaTag < ActiveRecord::Migration
  def up
    add_column :galleries , :meta_keywords     , :string
    add_column :cities    , :meta_keywords     , :string
    add_column :articles  , :meta_keywords     , :string
    add_column :newses    , :meta_keywords     , :string
    add_column :pages      , :meta_keywords    , :string

    add_column :galleries , :meta_description  , :string
    add_column :cities    , :meta_description  , :string
    add_column :articles  , :meta_description  , :string
    add_column :newses    , :meta_description  , :string
    add_column :pages      , :meta_description , :string

    add_column :pages     , :title             , :string
  end

  def down
    remove_column :galleries , :meta_keywords
    remove_column :cities    , :meta_keywords
    remove_column :articles  , :meta_keywords
    remove_column :newses    , :meta_keywords
    remove_column :pages     , :meta_keywords

    remove_column :galleries , :meta_description
    remove_column :cities    , :meta_description
    remove_column :articles  , :meta_description
    remove_column :newses    , :meta_description
    remove_column :pages     , :meta_description

    remove_column :pages     , :title
  end
end
