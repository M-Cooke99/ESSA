module wrapper(
	input wire clk,
	input wire reset,
	input wire enable,
	inout wire scl,
	inout wire sda,
	output reg[15:0] data
);

	localparam  DATA_WIDTH          =   16;
	localparam  REGISTER_WIDTH      =   16;
	localparam  ADDRESS_WIDTH       =   15;
	localparam  CLOCK_FREQUENCY     =   50_000_000;
	localparam  CLOCK_PERIOD        =   1e9/CLOCK_FREQUENCY;
	
	reg             rw              =   1;
	reg     [15:0]   reg_addr        =   0;
	reg     [14:0]   device_addr     =   1;
	reg     [15:0]  divider         =   16'h0001;
	reg     [15:0]   data_to_write   =   16'h0000;


	wire                            i2c_master_clock;
	wire                            i2c_master_reset_n;
	wire                            i2c_master_enable;
	wire                            i2c_master_read_write;
	wire    [DATA_WIDTH-1:0]        i2c_master_mosi_data;
	wire    [REGISTER_WIDTH-1:0]    i2c_master_register_address;
	wire    [ADDRESS_WIDTH-1:0]     i2c_master_device_address;
	wire    [15:0]                  i2c_master_divider;
	wire    [DATA_WIDTH-1:0]        i2c_master_miso_data;
	wire                            i2c_master_busy;

	i2c_master #(.DATA_WIDTH(DATA_WIDTH),.REGISTER_WIDTH(REGISTER_WIDTH),.ADDRESS_WIDTH(ADDRESS_WIDTH))
	i2c_master(
					.clock                  (i2c_master_clock),
					.reset_n                (i2c_master_reset_n),
					.enable                 (i2c_master_enable),
					.read_write             (i2c_master_read_write),
					.mosi_data              (i2c_master_mosi_data),
					.register_address       (i2c_master_register_address),
					.device_address         (i2c_master_device_address),

					.divider                (i2c_master_divider),
					.miso_data              (i2c_master_miso_data),
					.busy                   (i2c_master_busy),

					.external_serial_data   (sda),
					.external_serial_clock  (scl)
	);


	assign i2c_master_clock             =   clk;
	assign i2c_master_reset_n           =   reset;
	assign i2c_master_enable            =   enable;
	assign i2c_master_read_write        =   rw;
	assign i2c_master_mosi_data         =   data_to_write;
	assign i2c_master_device_address    =   device_addr;
	assign i2c_master_register_address  =   reg_addr;
	assign i2c_master_divider           =   divider;

endmodule