namespace Online_Shop.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.BeanBagTypes", "picture", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.BeanBagTypes", "picture");
        }
    }
}
