
//
// ObjectPool keeps record of available game objects, which may be currrently in use or free.
//
struct ObjectPool {
    import void AddObjects(int from, int to);
    import void RemoveAll();
    import void RemoveObjects(int from, int to);

    import int  Acquire();
    import void Release(int id);
    import void ReleaseAll();
    
    // Gets number of acquired objects
    import int  GetAcquiredNum();
    // Gets number of available free objects
    import int  GetFreeNum();
    // Gets total number of registered objects
    import int  GetTotalNum();
    // Gets pool capacity (may include empty slots!)
    import int  GetPoolSize();

    protected int _capacity;
    protected int _numUsed;
    protected bool _usingObj[];
    protected bool _isFree[];
    protected int _freeObj[];
    protected int _numFreeObj;
};


//
// Helper functions which perform operations on arrays of ints
//
import int[] Array_ExpandIf(int arr[], int valid_count, int need_capacity, int elem_sz = 1);
