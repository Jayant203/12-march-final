
resource "aws_db_instance" "ion-db" {
	allocated_storage    = 20
	identifier           = "testinstance"
	storage_type         = "gp2"
	engine               = "mysql"
	engine_version       = "5.7"
	instance_class       = "db.t2.micro"
	publicly_accessible  = true
	name                 = "test"
	db_subnet_group_name = "${aws_db_subnet_group.db-subnet.name}"
    vpc_security_group_ids      = [aws_security_group.WebServer.id]
	username             = var.rds_user
	password             = var.rds_pwd
	skip_final_snapshot  = true
	parameter_group_name = "default.mysql5.7"
}
# for populating rds into the private subnets
resource "aws_db_subnet_group" "db-subnet" {
	name                 = "db_subnet_group"
	subnet_ids           = ["${aws_subnet.PrivateAZA.id}","${aws_subnet.PrivateAZB.id}"]
}

resource "null_resource" "provision_web" {
	depends_on = [aws_db_instance.ion-db]
	provisioner "local-exec"{
	  command = "sh terraform-script.sh"
	  environment={
		  rds_endpt = aws_db_instance.ion-db.endpoint
		  rds_user = var.rds_user
		  rds_pwd = var.rds_pwd
	  }
      
	}
}

