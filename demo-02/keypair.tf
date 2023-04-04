module "key-pair" {
  source       = "../all-modules/keypair"
  encrypt-kind = "RSA"
  encrypt-bits = 4096
}