static inline pid_t gettid(void)
{
#if defined(LINUX) && defined(SYS_gettid)
    return syscall(SYS_gettid);
#else
    return getpid();
#endif
}


