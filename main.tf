resource "aws_security_group" "allow_tls" {
    name        = var.sg_name
    description = var.sg_description
    vpc_id      = var.vpc_id

    tags = merge(
        var.common_tags,
        var.sg_tags,
        {
            Name = local.resource_name
        }
    )

    dynamic "ingress" {
    for_each = var.ingress_rules
        content{
            from_port        = ingress.value["from_port"] #each.value[<key-name>]
            to_port          = ingress.value["to_port"]
            protocol         = ingress.value["protocol"]
            cidr_blocks      = ingress.value["allowed_cidr"]
        }
    }

    dynamic "egress" {
    for_each = var.egress_rules
        content{
            from_port        = egress.value["from_port"] #each.value[<key-name>]
            to_port          = egress.value["to_port"]
            protocol         = egress.value["protocol"]
            cidr_blocks      = egress.value["allowed_cidr"]
        }
    }
}