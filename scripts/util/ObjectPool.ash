// ObjectPool is open source under the MIT License.
//
// TERMS OF USE - ObjectPool MODULE
//
// Copyright (c) 2020-present Ivan Mogilko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//////////////////////////////////////////////////////////////////////////////////////////
//
// Module implements ObjectPool class which helps to keep track of a list of reusable
// objects. It does not matter what kind of objects are these so long as they have
// integer IDs.
//
// In simple words, ObjectPool remembers which IDs are free and which are in use.
// It gives you next free ID by demand, and lets you mark used ID as a free one when you
// are no longer using it.
//
//////////////////////////////////////////////////////////////////////////////////////////

#ifndef __OBJECTPOOL_MODULE__
#define __OBJECTPOOL_MODULE__

#define OBJECTPOOL_VERSION_00_01_00_00

struct ObjectPool {
    // Adds a range of IDs into the list. You can keep adding more later and all the previous
    // ones will be kept unless you call RemoveObjects or RemoveAll.
    import void AddObjects(int from, int to);
    // Removes a range of IDs from the list.
    import void RemoveObjects(int from, int to);
    // Removes all IDs.
    import void RemoveAll();

    // Gives next free ID and marks it as "used". Returns -1 if no more free IDs are available.
    import int  Acquire();
    // Marks given ID as "free".
    import void Release(int id);
    // Marks all the known IDs as "free".
    import void ReleaseAll();
    
    // Gets number of acquired ("used") IDs
    import int  GetAcquiredNum();
    // Gets number of available free IDs
    import int  GetFreeNum();
    // Gets total number of registered IDs
    import int  GetTotalNum();
    // Gets pool capacity (may include empty slots!). This is for test purposes only.
    import int  GetPoolSize();

    protected int _capacity;
    protected int _numUsed;
    protected bool _usingObj[];
    protected bool _isFree[];
    protected int _freeObj[];
    protected int _numFreeObj;
};

#endif  // __OBJECTPOOL_MODULE__
