data "oci_objectstorage_replication_policies" "objectstorage_replication_policies_lookup" {
  for_each = var.objectstorage_replication_policies_lookup

  bucket    = each.value.bucket
  namespace = each.value.namespace

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

