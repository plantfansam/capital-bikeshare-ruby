# :bike::gem::us::bike::gem::us::bike::gem::us: capital-bikeshare gem :bike::gem::us::bike::gem::us::bike::gem::us:

Wrapper for Capital Bikeshare station data (get the data [here](https://feeds.capitalbikeshare.com/stations/stations.xml)).

## Usage

### Installing
`gem install capital-bikeshare`

### Initializing the client

```ruby
client = CapitalBikeshare::Client.new
client.fetch # gets station data
```

Then you'll be able to use all of the methods described below.

### Listing Stations
```
> client.stations.class
=> Array
> client.stations.first
=> #<CapitalBikeshare::Station:0x007fd7ae8728b8 @id=1,
@name="Eads St & 15th St S",
@terminal_name=31000,
@last_comm_with_server=#<DateTime: 2016-08-07T11:40:40+00:00 ((2457608j,42040s,0n),+0s,2299161j)>,
@lat=38.858662,
@long=-77.053199,
@installed=true,
@locked=false,
@install_date=nil,
@removal_date=nil,
@temporary=false,
@public=true,
@nb_bikes=4,
@nb_empty_docks=10,
@latest_update_time=#<DateTime: 2016-08-07T09:02:21+00:00 ((2457608j,32541s,0n),+0s,2299161j)>>
```

### Finding Stations

Each station has an ID in the [XML](https://feeds.capitalbikeshare.com/stations/stations.xml); each station also has a name attribute. You can use `client.find` to find a particular station (under the hood, this method will delegate to `find_by_name` or `find_by_id` based on the argument's class).

```
> client.find(1)
=> #<CapitalBikeshare::Station:0x007fce32faa958 @id=1,
@name="Eads St & 15th St S",
@terminal_name=31000,
@last_comm_with_server=#<DateTime: 2016-08-07T11:46:57+00:00 ((2457608j,42417s,0n),+0s,2299161j)>,
@lat=38.858662,
@long=-77.053199,
@installed=true,
@locked=false,
@install_date=nil,
@removal_date=nil,
@temporary=false,
@public=true,
@nb_bikes=4,
@nb_empty_docks=10,
@latest_update_time=#<DateTime: 2016-08-07T09:02:21+00:00((2457608j,32541s,0n),+0s,2299161j)>>
```

```
> client.find("18th & Eads St.")
=> #<CapitalBikeshare::Station:0x007fce32fa0e80 @id=2,
@name="18th & Eads St.",
@terminal_name=31001,
@last_comm_with_server=#<DateTime: 2016-08-07T11:46:17+00:00((2457608j,42377s,0n),+0s,2299161j)>,
@lat=38.85725,
@long=-77.05332,
@installed=true,
@locked=false,
@install_date=nil,
@removal_date=nil,
@temporary=false,
@public=true,
@nb_bikes=7,
@nb_empty_docks=4,
@latest_update_time=#<DateTime: 2016-08-07T09:02:04+00:00((2457608j,32524s,0n),+0s,2299161j)>
```

### Working with stations

This gem makes each station's XML attributes available in Rubyrific `snake_case` and coerces the values to their appropriate type. Here's the methods:


```ruby
:id,
:nb_bikes,
:nb_empty_docks,
:terminal_name,
:last_comm_with_server,
:install_date,
:removal_date,
:latest_update_time,
:installed,
:locked,
:temporary,
:public,
:lat,
:long,
:name
```

FYI, the XML for a station looks like this:

```xml
<station>
	<id>1</id>
	<name>Eads St & 15th St S</name>
	<terminalName>31000</terminalName>
	<lastCommWithServer>1470570178374</lastCommWithServer>
	<lat>38.858662</lat>
	<long>-77.053199</long>
	<installed>true</installed>
	<locked>false</locked>
	<installDate>0</installDate>
	<removalDate/>
	<temporary>false</temporary>
	<public>true</public>
	<nbBikes>4</nbBikes>
	<nbEmptyDocks>10</nbEmptyDocks>
	<latestUpdateTime>1470560541955</latestUpdateTime>
</station>
```
