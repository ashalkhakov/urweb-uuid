#include <ctype.h>
#include <string.h>

#include <uuid/uuid.h>

#include <urweb.h>
#include <uuid.h>

uw_Basis_string uw_Uuid__FFI_generate(uw_context ctx, uw_Basis_unit tmp) {
  uuid_t uuid;

  uuid_generate(uuid);
  
  char *buf = (char*)uw_malloc(ctx, 37); // 36 characters + 0-terminator
  uuid_unparse_lower(uuid, buf);

  return buf;
}
