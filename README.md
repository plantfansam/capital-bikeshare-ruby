# ruby-capital-bikeshare

Wrapper for Capital Bikeshare station data (get the data [here](https://www.capitalbikeshare.com/data/stations/bikeStations.xml)).

## Usage

`gem install capital-bikeshare`

```ruby
> c = CapitalBikeshare::Client.new
> c.fetch
> c.stations.length
=> 391
> c.stations.first.class
=> CapitalBikeshare::Station
```

### `CapitalBikeshare::Station` methods

`:id, :nb_bikes, :nb_empty_docks, :terminal_name, :last_comm_with_server, :install_date, :removal_date, latest_update_time, :installed, :locked, :temporary, :public, :lat, :long, :name`
