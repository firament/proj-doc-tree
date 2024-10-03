## Counters

    a b c d e f g h i j k l m n o p q r s t u v w x y z
    # - - - - - - - - - - - - - - - - - - - - - - - - -
    z y x w v u t s r q p o n m l k j i h g f e d c b a

## Script Naming Conventions
- All create and seed script names with increasing counters `[a..z]`
    - Drop or rollback scripts shall have decreasing counters `[z..a]`
- 10x initialization files
- 20x table creation
- 30x view creation
    - CREATE OR REPLACE VIEW syntax for each view
    - keep counter synced with table create scripts
- 40x other configuration
    - keep counter synced with table create scripts
- 50x data seeds
    - keep counter synced with table create scripts
- 60x permission applies
- 80x drop views
    - keep counter synced with table create scripts
    - with decreasing counters
- 90x drop tables
    - keep counter synced with table create scripts
    - with decreasing counters
- 91x test data seeds, suffixed with -TEST
- 92x script outputs, suffixed with -raw

## Multiple databases
When multiple databases are needed, create a subfolder for each database, with a common folder for code that is to be included in all databases.
