module "ec2_module" {
  source        = "../../Terraform module/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  name          = "demo-ec2"
}
