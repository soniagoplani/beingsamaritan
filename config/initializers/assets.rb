# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf|woff2)\z/
Rails.application.config.assets.precompile += %w( signin.css )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( problemcategory.css )
Rails.application.config.assets.precompile += %w( problemcategory.js )
Rails.application.config.assets.precompile += %w( problem_post.css )
Rails.application.config.assets.precompile += %w( problem_post.js )
Rails.application.config.assets.precompile += %w( after_login.css )
Rails.application.config.assets.precompile += %w( after_login.js )

Rails.application.config.assets.precompile += %w( ckeditor/* )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
