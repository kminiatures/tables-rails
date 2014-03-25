# TablesRails

This project rocks and uses MIT-LICENSE.

## Install

#### Gemfile

```
gem "tables-rails"
```

#### config/routes.rb

``` 
mount TablesRails::Engine => '/tables'
```

## Configuration

### Devise
#### config/initializers/tables_rails.rb
``` 
if defined?(TablesRails)
  # set device method
  TablesRails.authenticate_method = :authenticate_manage_user!
end
```
