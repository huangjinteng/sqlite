# Run this TCL script in order to build using MSVC multiple times
# with various compile-time options.  Use this to verify that the various
# compile-time options all work with MSVC.
#
set OPTIONS [list \
  SQLITE_OMIT_ALTERTABLE \
  SQLITE_OMIT_ANALYZE \
  SQLITE_OMIT_ATTACH \
  SQLITE_OMIT_AUTHORIZATION \
  SQLITE_OMIT_AUTOINCREMENT \
  SQLITE_OMIT_AUTOINIT \
  SQLITE_OMIT_AUTOMATIC_INDEX \
  SQLITE_OMIT_AUTORESET \
  SQLITE_OMIT_AUTOVACUUM \
  SQLITE_OMIT_BETWEEN_OPTIMIZATION \
  SQLITE_OMIT_BLOB_LITERAL \
  SQLITE_OMIT_BTREECOUNT \
  SQLITE_OMIT_CASE_SENSITIVE_LIKE_PRAGMA \
  SQLITE_OMIT_CAST \
  SQLITE_OMIT_CHECK \
  SQLITE_OMIT_COMPILEOPTION_DIAGS \
  SQLITE_OMIT_COMPLETE \
  SQLITE_OMIT_COMPOUND_SELECT \
  SQLITE_OMIT_CONFLICT_CLAUSE \
  SQLITE_OMIT_CTE \
  SQLITE_OMIT_DATETIME_FUNCS \
  SQLITE_OMIT_DECLTYPE \
  SQLITE_OMIT_DEPRECATED \
  SQLITE_OMIT_DESERIALIZE \
  SQLITE_OMIT_DISKIO \
  SQLITE_OMIT_EXPLAIN \
  SQLITE_OMIT_FLAG_PRAGMAS \
  SQLITE_OMIT_FLOATING_POINT \
  SQLITE_OMIT_FOREIGN_KEY \
  SQLITE_OMIT_GENERATED_COLUMNS \
  SQLITE_OMIT_GET_TABLE \
  SQLITE_OMIT_HEX_INTEGER \
  SQLITE_OMIT_INCRBLOB \
  SQLITE_OMIT_INTEGRITY_CHECK \
  SQLITE_OMIT_INTROSPECTION_PRAGMAS \
  SQLITE_OMIT_JSON \
  SQLITE_OMIT_LIKE_OPTIMIZATION \
  SQLITE_OMIT_LOAD_EXTENSION \
  SQLITE_OMIT_LOCALTIME \
  SQLITE_OMIT_LOOKASIDE \
  SQLITE_OMIT_MEMORYDB \
  SQLITE_OMIT_OR_OPTIMIZATION \
  SQLITE_OMIT_PAGER_PRAGMAS \
  SQLITE_OMIT_PARSER_TRACE \
  SQLITE_OMIT_POPEN \
  SQLITE_OMIT_PRAGMA \
  SQLITE_OMIT_PROGRESS_CALLBACK \
  SQLITE_OMIT_QUICKBALANCE \
  SQLITE_OMIT_RANDOMNESS \
  SQLITE_OMIT_REINDEX \
  SQLITE_OMIT_SCHEMA_PRAGMAS \
  SQLITE_OMIT_SCHEMA_VERSION_PRAGMAS \
  SQLITE_OMIT_SHARED_CACHE \
  SQLITE_OMIT_SHUTDOWN_DIRECTORIES \
  SQLITE_OMIT_SUBQUERY \
  SQLITE_OMIT_TCL_VARIABLE \
  SQLITE_OMIT_TEMPDB \
  SQLITE_OMIT_TEST_CONTROL \
  SQLITE_OMIT_TRACE \
  SQLITE_OMIT_TRIGGER \
  SQLITE_OMIT_TRUNCATE_OPTIMIZATION \
  SQLITE_OMIT_UPSERT \
  SQLITE_OMIT_UTF16 \
  SQLITE_OMIT_VACUUM \
  SQLITE_OMIT_VIEW \
  SQLITE_OMIT_VIRTUALTABLE \
  SQLITE_OMIT_WAL \
  SQLITE_OMIT_WINDOWFUNC \
  SQLITE_OMIT_WSD \
  SQLITE_OMIT_XFER_OPT \
  SQLITE_ALLOW_ROWID_IN_VIEW \
  SQLITE_DISABLE_DIRSYNC \
  SQLITE_DISABLE_LFS \
  SQLITE_ENABLE_ATOMIC_WRITE \
  SQLITE_ENABLE_COLUMN_METADATA \
  SQLITE_ENABLE_EXPENSIVE_ASSERT \
  SQLITE_ENABLE_FTS3 \
  SQLITE_ENABLE_FTS3_PARENTHESIS \
  SQLITE_ENABLE_FTS4 \
  SQLITE_ENABLE_IOTRACE \
  SQLITE_ENABLE_LOAD_EXTENSION \
  SQLITE_ENABLE_LOCKING_STYLE \
  SQLITE_ENABLE_MEMORY_MANAGEMENT \
  SQLITE_ENABLE_MEMSYS3 \
  SQLITE_ENABLE_MEMSYS5 \
  SQLITE_ENABLE_OVERSIZE_CELL_CHECK \
  SQLITE_ENABLE_RTREE \
  SQLITE_ENABLE_STAT3 \
  SQLITE_ENABLE_UNLOCK_NOTIFY \
  SQLITE_ENABLE_UPDATE_DELETE_LIMIT \
]
foreach opt $OPTIONS {
  exec fossil clean -x
  set cmd "nmake /f Makefile.msc CCOPTS=-D$opt USE_FULLWARN=0"
  puts $cmd
  set res [catch {eval exec $cmd} outtxt]
  if {$res} {
    puts "FAILED:\n$outtxt"
    exit
  }
}
